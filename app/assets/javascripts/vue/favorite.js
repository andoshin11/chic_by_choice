import Vue from 'vue';

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
    add() {
      console.log("sup?");
      console.log(this.itemId);
    }
  },
};
