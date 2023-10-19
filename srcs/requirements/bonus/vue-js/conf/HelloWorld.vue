<template>
  <div class="hello-world">
    <div class="welcome-message">
      {{ message }}
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      message: "Bienvenue sur le site statique en VueJS de Mouslim Mourdalov !",
    };
  },
  mounted() {
    this.addAnimation();
  },
  methods: {
    addAnimation() {
      this.$el.classList.add("fade-in");
    },
  },
};
</script>

<style scoped>
.hello-world {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
}

.welcome-message {
  color: #0073e6;
  font-size: 24px;
  text-align: center;
}

.fade-in {
  opacity: 0;
  animation: fadeIn 1s ease-in forwards;
}

@keyframes fadeIn {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}
</style>
