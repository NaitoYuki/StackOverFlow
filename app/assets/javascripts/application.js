//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require twitter/bootstrap
//= require jquery-ui
//= require tag-it
//= require marked
//= require_tree .

$( document ).on ('turbolinks:load', function(){
  var i, len, ref, results, tag;
  $('#question-tags').tagit({
    fieldName: 'question[tag_list]',
    singleField: true,
    availableTags: gon.available_tags
  });

  if (gon.question_tags != null) {
    ref = gon.question_tags;
    results = [];
    for (i = 0, len = ref.length; i < len; i++) {
      tag = ref[i];
      results.push($('#question-tags').tagit('createTag', tag));
    }
    return results;
  }
})
