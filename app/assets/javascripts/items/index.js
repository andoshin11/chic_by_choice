import Vue from 'vue';
import page from './../utils/page';
import indexField from './index_field.vue';

page('items', 'index', () => {
  new Vue({
    el: '#index-field',
    render(createElement) {
      return createElement(indexField);
    }
  });
});
