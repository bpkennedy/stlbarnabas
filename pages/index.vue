<template>
  <CBox
    v-bind="mainStyles[colorMode]"
    d="flex"
    w="100vw"
    h="100vh"
    flex-dir="column"
    justify-content="center"
  >
    <h1 class="title">
      Paw Waves
    </h1>
    <section v-for="post in posts" :key="post.fields.slug">
      <div class="image" />
      <h2 class="title">
        <nuxt-link :to="post.fields.slug">
          {{ post.fields.title }}
        </nuxt-link>
      </h2>
      <p class="description">
        {{ post.fields.description }}
        <br />
        <nuxt-link :to="post.fields.slug" class="more">
          Read more ⟶
        </nuxt-link>
      </p>
    </section>
  </CBox>
</template>

<script lang="js">
import { CBox } from '@chakra-ui/vue'
import { mapState } from 'vuex'

export default {
  name: 'App',
  components: {
    CBox,
  },
  inject: ['$chakraColorMode'],
  data () {
    return {
      mainStyles: {
        dark: {
          bg: 'gray.700',
          color: 'whiteAlpha.900',
        },
        light: {
          bg: 'white',
          color: 'gray.900',
        },
      },
    }
  },
  computed: {
    ...mapState(['posts']),
    colorMode () {
      return this.$chakraColorMode()
    },
  },
}
</script>

<style lang="scss">
section {
  display: grid;
  grid-template-columns: repeat(5, 1fr);
  grid-template-rows: 20px 20px 1fr;
  grid-column-gap: 20px;
  grid-row-gap: 20px;
  padding: 30px 0;
  min-height: 250px;
  h2,
  p {
    margin-top: 0;
  }
}

@media only screen and (max-width: 600px) {
  section {
    grid-template-rows: 40px 20px 1fr;
  }
}

.image {
  grid-area: 1 / 1 / 4 / 3;
  opacity: 0.8;
}
.title {
  grid-area: 1 / 3 / 2 / 6;
}
.description {
  grid-area: 2 / 3 / 3 / 6;
}

.more {
  color: #eee;
}
</style>
