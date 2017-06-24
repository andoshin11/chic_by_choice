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
  computed: {
    filteredItems() {
      let items = this.items;
      return items.filter(x => this.priceRange[0] <= x.hirePrice).filter(x => x.hirePrice <= this.priceRange[1]);
    },
    pageTotalNum() {
      return Math.floor( this.filteredItems.length / this.viewNum ) + 1;
    },
    pages() {
      let pages = [];
      for (let i = 1; i <= this.pageTotalNum; i++) {
        pages.push(i);
      }
      return pages;
    }
  },
  data() {
    return {
      priceRange: [0, 500],
      viewNum: 14,
      currentPage: 1,
      items: [],
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
