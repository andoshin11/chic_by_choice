import Vue from 'vue';
import page from './../utils/page';
import cartField from './cart_field.vue';

page('carts', 'show', () => {
  new Vue({
    el: '#cart-field',
    render(createElement) {
      return createElement(cartField);
    }
  });
});
