/**
 * Created by yang_z on 2015/5/31.
 */
    function bindDropDown() {
    $('.am-dropdown-content').children('li').children('a').on('click', function () {
        var value = $(this).parent().attr('value');
        var content = this.innerHTML;
        var html = content + '<span class="cornor fr">∨</span>';
        var root = $(this).parent('li').parent('ul').parent('div');
        root.removeClass('am-active');
        var button = root.children('button')[0];
        button.innerHTML = html;
        button.click();
        root.attr('value', value);
    });

}

    function initSelect(selecter_id , data){
        var selecter = $('#'+selecter_id);
        selecter.children('button')[0].innerHTML = data.title + '<span class="cornor fr">∨</span>';
        var selcter_child = template('selecter_creater',data);
          selecter.children('ul')[0].innerHTML = selcter_child;
        bindDropDown();
    }


function bindTab(){
    $('.common_tab').on('click',function(){
        var currentNode = $(this);
        var parent = $(this).parent();
        var childs = parent.children();

        childs.each(function(index,node){
            var cNode = $(node);
        if(cNode.hasClass(cNode.attr('id')+'_active')){
            cNode.removeClass(cNode.attr('id')+'_active');
        }
        });
        currentNode.addClass(currentNode.attr('id')+'_active');
    });
}

function getRadioValue(form_id){
    return $('#'+form_id).attr('value');
}

function bindRadioClick(){
               $('.common_selecter').on('click',function(){
               var select_radio_img_src = '/static/image/index/radio_selected.png';
            var unselect_radio_img_src = '/static/image/index/radio_unselect.png';
               var parent = $(this).parent();
               var currentNode = $(this);
               var child = parent.children('div');
                $(child).each(function(index,n){
                $(n).children('img')[0].src = unselect_radio_img_src;
               });
               currentNode.children('img')[0].src = select_radio_img_src;
                parent.attr('value',currentNode.attr('value'));
           });
}

