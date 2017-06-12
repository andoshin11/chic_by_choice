import Vue from 'vue';
import page from './../utils/page';
import wishlist from './wishlist.vue';

page('favorite_lists', 'show', () => {
  new Vue({
    el: '#wishlist',
    render(createElement) {
      return createElement(wishlist);
    }
  });
});
