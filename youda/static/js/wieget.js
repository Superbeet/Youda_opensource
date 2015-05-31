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


