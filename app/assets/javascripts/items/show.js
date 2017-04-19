import Vue from 'vue';
import page from './../utils/page';
import itemField from './item_field.vue';

page('items', 'show', () => {
  new Vue({
    el: '#item-field',
    render(createElement) {
      return createElement(itemField);
    }
  });
});
