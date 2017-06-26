import HTTP from './../http';
import sharedStore from './../shared_store';

export default {
  computed: {
    calcTime() {
      const countTime = this.countTime;
      if (countTime > 0){
        let min = Math.floor(countTime / 60);
        let sec = (countTime % 60);
        if (min < 10) min = "0" + min;
        if (sec < 10) sec = "0" + sec;
        return min + ":" + sec;
      } else {
        return "00:00";
      }
    }
  },
  data() {
    return {
      addCode: false,
      cart: {
        items: [],
      },
      countTime: 1200,
    };
  },
  methods: {
    async fetch() {
      try {
        const { cart: cart } = await HTTP.get(`/api/carts`);
        this.cart = cart;
        sharedStore.cart.items = cart.items;
      } catch (e) {
        console.error(e);
      }
    },
    addCode() {

    },
    async removeFromCart(itemId) {
      try {
        await HTTP.delete(`/api/cart_items/`);
        this.fetch();
      } catch (e) {
        alert("Something went wrong.");
        console.error(e);
      }
    },
  },
  mounted() {
    this.fetch();
    setInterval(()=>this.countTime--, 1000);
  },
};
