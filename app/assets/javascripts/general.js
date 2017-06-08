import Vue from 'vue';
import topBar from './general/top_bar.vue';

new Vue({
  el: '#top-bar',
  render(createElement) {
    return createElement(topBar);
  }
});
