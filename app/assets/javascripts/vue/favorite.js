import Vue from 'vue';
import HTTP from './../http';

export default {
  props: {
    itemId: {
      require: true,
    }
  },
  computed: {
  },
  data () {
    return {
    };
  },
  watch: {
  },
  methods: {
    async add() {
      try {
        await HTTP.post('/api/favorites', {
          itemId: this.itemId,
        });
        alert("Item added to your Favorite List");
      } catch (e) {
        console.error(e);
      }
    },
  },
};
