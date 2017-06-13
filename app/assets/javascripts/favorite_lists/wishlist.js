import HTTP from './../http';
import sharedStore from './../shared_store';
import favorite from './../vue/favorite.vue';

export default {
  components: {
    favorite,
  },
  data() {
    return {
      sharedStore: sharedStore
    };
  },
  methods: {
    async fetch() {
      try {
        const { favoriteList: favoriteList } = await HTTP.get('/api/favorite_lists');
        sharedStore.favoriteList = favoriteList;
      } catch (e) {
        console.error(e);
      }
    },
    itemLink(item) {
      return `/items/${item.id}`
    }
  },
  watch: {
  },
  mounted() {
    this.fetch();
  },
};
