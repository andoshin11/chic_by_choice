import HTTP from './../http';
import sharedStore from './../shared_store';

export default {
  components: {
  },
  data() {
    return {
      cart: sharedStore.cart,
      sharedStore: sharedStore,
    };
  },
  methods: {
    async fetch() {
      try {
        const { cart: cart } = await HTTP.get('/api/carts');
        sharedStore.cart = cart;
        this.cart = sharedStore.cart;
        const { favoriteList: favoriteList } = await HTTP.get('/api/favorite_lists');
        sharedStore.favoriteList = favoriteList;
      } catch (e) {
        console.error(e);
      }
    }
  },
  watch: {
    sharedStore() {
      this.cart = sharedStore.cart;
    }
  },
  mounted() {
    this.fetch();

  },
};
