TodoList = Behavior.create({
  initialize: function(options) {
    //Make form buttons disapear
    this.form = this.element.up('form'); //Setting up form element
    this.element.up('form').down('#todos_action').hide();
    
    //Get Auth Token (Rails Security)
    this.auth_token = this.form.select('[name=authenticity_token]').first().value;
    
  },
  onclick :  Event.delegate({
    'input[type=checkbox]' : function(e) {
      var el = e.element();
      var id = el.id.match(/\d{1,}/);
      //alert('el = ' + el.inspect() + '\n' + 'id = ' + id)
      new Ajax.Request('/todonts/' + id, {asynchronous:true, 
                                       evalScripts:true, 
                                       method:'put', 
                                       onSuccess:function(request){
                                         var li = el.up('li');
                                         if(el.checked){
                                           li.addClassName('complete');
                                         }else{
                                            li.removeClassName('complete');
                                         };
                                         li.highlight(); 
                                       },
                                       parameters:'todo[complete]=' + el.checked + '&authenticity_token=' + encodeURIComponent(this.auth_token)});
                                    },
    'a.delete' : function(e) {
      var el = e.element();
      var li = el.up('li');
      var id = li.id.match(/\d{1,}/);
      var record_name = li.down('span.name').innerHTML;
      
      Event.stop(e);
      if (confirm('Are you sure you want to remove ' + record_name  +'?')) {
        new Ajax.Request('/todonts/' + id, {asynchronous:true, 
                                       evalScripts:true, 
                                       method:'delete', 
                                       onSuccess:function(request){
                                         var li = el.up('li');
                                         li.fade(); 
                                       },
                                       parameters:'authenticity_token=' + encodeURIComponent(this.auth_token)});
      }
    }
  })
});