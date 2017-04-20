import HTTP from './../http';

export default {
  data() {
    return {
      item: null,
    };
  },
  methods: {
    async fetch() {
      try {
        const { item: item } = await HTTP.get('/api/items/1');
        this.item = item;
      } catch (e) {
        console.error(e);
      }
    },
  },
  watch: {
  },
  mounted() {
    this.fetch();
  },
};
