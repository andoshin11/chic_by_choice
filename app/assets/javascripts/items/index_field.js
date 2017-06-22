import HTTP from './../http';
import datePicker from './date_picker.vue';
import favorite from './../vue/favorite.vue';
import vueSlider from 'vue-slider-component/src/vue2-slider.vue';

export default {
  components: {
    datePicker,
    favorite,
    vueSlider,
  },
  data() {
    return {
      priceRange: [0, 500],
      items: [],
      colourFilter: [],
      lengthFilter: [],
      trendsFilter: [],
      sortBy: [
        {
          label: "FEATURED",
          key: 0,
        },
        {
          label: "PRICE HIGH TO LOW",
          key: 1,
        },
        {
          label: "PRICE LOW TO HIGH",
          key: 2,
        },
        {
          label: "MOST POPULAR",
          key: 3,
        },
      ],
      sortByKey: 0,
    };
  },
  methods: {
    async fetch() {
      try {
        const { items: items } = await HTTP.get('/api/items');
        this.items = items;
        console.log(items);
      } catch (e) {
        console.error(e);
      }
    },
    toggleActive(className) {
      const target = document.getElementsByClassName(className)[0];
      this.removeActive(target);
      target.classList.toggle('active');
    },
    removeActive(exception) {
      const active = document.getElementsByClassName("active");
      if (!active) return;
      Array.from(active).forEach(x => {
        if(x != exception) x.classList.remove('active');
      })
    },
    itemLink(item) {
      return `/items/${item.id}`
    }
  },
  mounted() {
    this.fetch();
  },
};
