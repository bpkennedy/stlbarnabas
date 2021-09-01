<template>
  <section class="container">
    <p class="back">
      <nuxt-link exact to="/">
        ⟵ Back to Home
      </nuxt-link>
    </p>
    <h1>{{ post.fields.title }}</h1>
    <div
      class="image"
    />
    <article v-html="$md.render(post.fields.body)" />
  </section>
</template>

<script>
export default {
  data () {
    return {
      slug: this.$route.params.slug,
    }
  },
  head () {
    return {
      title: this.post.fields.title,
    }
  },
  computed: {
    post () {
      const post = this.$store.state.posts.filter(
        el => el.fields.slug === this.slug,
      )
      return post[0]
    },
  },
}
</script>

<style lang="scss" scoped>
.back {
  margin-top: 20px;
}

.image {
  width: 100%;
  height: 300px;
  margin: 30px 0;
  background-size: 100% auto !important;
}
</style>
