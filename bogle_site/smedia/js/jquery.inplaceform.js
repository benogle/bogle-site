/*  (MIT License)

	Copyright (c) 2009 Ben Ogle
	
	Permission is hereby granted, free of charge, to any person
	obtaining a copy of this software and associated documentation
	files (the "Software"), to deal in the Software without
	restriction, including without limitation the rights to use,
	copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the
	Software is furnished to do so, subject to the following
	conditions:
	
	The above copyright notice and this permission notice shall be
	included in all copies or substantial portions of the Software.
	
	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
	EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
	OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
	NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
	HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
	WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
	FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
	OTHER DEALINGS IN THE SOFTWARE.

*/

/*
	InplaceForm is a collection of jQuery plugins that simplify inplace form activities.
	
	inplaceListAdder is a plugin allowing for AJAX additions to lists like 
	comments, todo items, etc. It has three modes: insert, append, and prepend.
	
	inplaceListEditor is a plugin for editing list items (comments, etc.) in 
	place.
	
	bindsaveForm will bind ctrl+s to your forms.
*/

(function($){

/*
	Bind save key events!!
*/
$.fn.bindsaveForm = function(submitFn){
    if(window.hotkeys){
    
		//$this is a form
		var $this = $(this);

		var cmd = 'Ctrl+s';
		if($.browser.opera) //right now, we can't override the Ctrl+s behaviour in Opera. :(
			cmd = 'Ctrl+q';

		if($.browser.msie){
			//form-bind hotkeys dont work in IE with the hotkeys plugin.
			$(window).bind('keydown', cmd, function(e){
				var targ = $(e.target);
				//if the place where ctrl+s was pressed is in our form, then submit!
				if(targ.parents('#' + $this[0].id).length > 0 && targ.is('select, textarea, input:text')){
					return submitFn();
				}
			});
		}
		else{ //ff, opera, and safari work the easy way.
			$this.bind('keydown', cmd, function(){
				return submitFn();
			});
		}
		
    }//end if hotkeys
};

/* 
	$.inplaceForm is the BASE class.
	
	Required settings are:
	
	{
		parent: '#list',
		loadingImage: '/path/to/img.gif',
		iframe: false,

		//callbacks
		submit: function(){},
		success: function(newItem){return true;},
		postsuccess: function(newItem){},
		error: function(errorDict){return true;},

		//selectors
		loadingSelector: '.loading',
		cancelSelector: '.cancel',
		errorSelectors:{} //key value pairs: { ErrorKey: '#selectorForError' }
    }
    
    inplaceForm handles the form submission and error placement.
*/

$.inplaceForm = function(settings, form){
    this.settings = settings;
    this.form = $(form);
    this.list = $(this.settings.parent);
    this.loadingImg = this.form.find(this.settings.loadingSelector);
    this.loadingImg.hide();
    this.loadingImg.html('<img src="'+ this.settings.loadingImage +'" />');
    this.cancelButton = this.form.find(this.settings.cancelSelector);
    
    this.submitted = false;
    
    this.init();
};

$.inplaceForm.defaultImage = '/images/loading.gif';

$.extend($.inplaceForm, {

    prototype:{
        init: function(){
            var $this = this;
            
            $this.cancelButton.click(function(){
				$this.cancelForm();
				return false;
			});

            this.form.bindsaveForm(function(){
                return $this.submit();
            });
            
            //standard form submission bindage
            this.form.submit(function(){
                return $this.submit();
            });
        },
        
        submitResponseHandler: function(data){
        
        	this.clearErrors();
								        
			if(data.success){
				//if no errors, call the derived class' success function.
				this.submitSuccess(data);
			}
			else
			{
				//else fill out any errors.
				if(this.settings.error.call(this, data.errors)){
					for(var k in data.errors){
						if(this.settings.errorSelectors[k]){
							this.form.find(this.settings.errorSelectors[k]).html(data.errors[k]);
						}
					}
				}
			}

			//reset the form for another submission
			this.submitted = false;
			this.cancelButton.show();
			this.loadingImg.hide();
			this.form.find('input:submit').removeAttr('disabled');
        },
        
        submit: function(){
        	if(!this.submitted){
        		
        		//signal that we are waiting for a response.
				this.submitted = true;
				
				//call the callback
				this.settings.submit.call(this);

				//disallow cancel or another submission
				this.cancelButton.hide();
				this.loadingImg.show();
				var submitButton = this.form.find('input:submit');
				submitButton.attr('disabled','disabled');

				var $this = this;
				this.form.ajaxSubmit({
					success: function(data){
						$this.submitResponseHandler(data);
					},
					iframe: $this.settings.iframe,
					dataType: 'json'
				});
			}
            
            return false;
        },
        
        clearErrors: function(){
			for(var k in this.settings.errorSelectors){
				this.form.find(this.settings.errorSelectors[k]).html('');
			}
		}, 

		clearForm: function(){
			this.clearErrors();
			this.form.find('textarea').val('');
			this.form.find('input:text').val('').focus().blur();
        },
        
        focusFirst: function(){
		    $(this.form.find('input:text')[0]).focus()
        },
        
        cancelForm: function(){
			//implement this!
			alert('NOT IMPLEMENTED');
        },
        
		submitSuccess: function(data){
			//implement this!
			alert('NOT IMPLEMENTED');
        }
    }
});
/************************/

/*
	$.fn.inplaceListAdd will return a $.inplaceListAdder object.

	The form's default action is used. The server must return json in the form:
	
	{
		success: true|false,
		errors: {
			somekey: "<div>Your error text</div>"
		},
		item: "<div>My new list item!</div>"
	}
	
	If success is true, the item HTML will be inserted into the DOM.
	
	If success is false, the html in the errors dictionary will be placed into 
	the form where specified. eg.
	
	HTML:
	
	<form>
		<div>
			<div class=".subject"></div>
			<div><input name="subject" type="text"/></div>
		</div>
	</form>
	
	$.fn.inplaceListAdd settings:
	
	{
		...
		errorSelectors: {
			subject: '.subject'
		},
		...
	}
	
	Then if the server response was:
	
	{
		success: false,
		errors: {
			subject: "<div>Subject error</div>",
			message: "<div>Message Error</div>"
		}
	}
	
	The subject error HTML would be placed into the form's .subject div.


*/

$.fn.inplaceListAdder = function(listSelector, options){
    var defaults = {

		//inplaceListAdd extensions
    	mode: 'insert', //insert, append, prepend

		//inplaceForm settings follow...
		
        parent: listSelector,
        loadingImage: $.inplaceForm.defaultImage,
        iframe: false,
        
        //callbacks
        submit: function(){},
        success: function(newItem){return true;},
        postsuccess: function(newItem){},
        error: function(errorDict){return true;},
		
		//selectors
		loadingSelector: '.loading',
		cancelSelector: '.cancel',
        errorSelectors:{} //key value pairs: { ErrorKey: '#selectorForError' }
    };
    
    var opts = $.extend(true, {}, defaults, options);
    
    return new $.inplaceListAdder(opts, this[0]);
};

//$.inplaceListAdder constructor
$.inplaceListAdder = function(settings, form){
	//call base class constructor
    $.inplaceForm.call(this, settings, form);
};

//extend base class
$.extend($.inplaceListAdder.prototype, $.inplaceForm.prototype);

//function definitions
$.extend($.inplaceListAdder.prototype, {

	init: function(){
		$.inplaceForm.prototype.init.call(this);

		var $this = this;

		if($this.isInsert()){
			$this.form.hide();
			
			//insert a hidden element to let the server know where 
			//the new item was put in the list.
			$this.form.append('<input type="hidden" name="item-index" class="ila-item-index"/>');

			//wrap so we can hold the link below as well. This is for UI.sortable interoperability.
			$this.wrapItems($this.list.children());

			//insert top link
			$this.list.prepend($this.makeInsertLink(0));
			
			//insert the links between each item.
			var count = 1;
			$this.list.find('.ila-item').each(function(){
				var child = $(this);
				$this.appendLink(child, count);
				count++;
			});
		}
	},

	isInsert: function(){
		return this.settings.mode == 'insert';
	},

	isAppend: function(){
		return this.settings.mode == 'append';
	},

	isPrepend: function(){
		return this.settings.mode == 'prepend';
	},

	showInsertLinks: function(){
		this.list.find('.ila-item-insert').show();
	},

	insertForm: function(link){
	
		if(this.isInsert() && !this.submitted){
			this.clearForm()
			this.showInsertLinks();
			link.hide()
			
			if(link.parent().hasClass('ila-item')){
				this.form.insertAfter(link.parent());
			}
			else{
				this.form.insertAfter(link); //is the top link.
			}
			
			this.form.find('input.ila-item-index').val(link.attr('index'));
			this.form.show();
			this.focusFirst();
		}
	},

	cancelForm: function(){
		this.clearForm();
		if(this.isInsert()){		
			this.showInsertLinks();
			this.form.hide();
		}
	},
	
	wrapItems: function(items){
		return items.wrap('<div class="ila-item"></div>').parent();
	},

	makeInsertLink: function(index){

		link = $('<a href="#" class="ila-item-insert" title="add a new item here"></a>');
		link.attr('index', index);
		link.data('adder', this);

		link.click(function(){
			var $this = $(this); 
			var adder = $this.data('adder');
			adder.insertForm($this);
			return false;
		});

		return link;
	},

	appendLink: function(item, index){
		item.append(this.makeInsertLink(index));
	},

	//recalculates the link indices after an item insertion.
	fixIndices: function(){
		var count = 0;
		this.list.find('.ila-item-insert').show().each(function(){
			$(this).attr('index', count);
			count++;
		});
	},

	insertNewData: function(newData){
		if(this.isInsert()){
			newData = this.wrapItems(newData)
			newData.insertAfter(this.form);

			this.appendLink(newData, 0);
			this.fixIndices();                        
			this.form.hide();
		}
		else if(this.isAppend())
			this.list.append(newData);
		else if(this.isPrepend())
			this.list.prepend(newData);
	},

	submitSuccess: function(data){

		if(data.item.length > 0){
			data = $(data.item);
			if(this.settings.success.call(this, data)){
				this.clearForm(); //clear it
				this.focusFirst(); //focus the first text element

				this.insertNewData(data);

				this.settings.postsuccess.call(this, data);
			}
		}
		else{
			alert('No data was returned');
		}

	}//end fn
});



})(jQuery);