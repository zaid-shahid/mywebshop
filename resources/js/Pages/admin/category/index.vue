<template>
  <admin-layout title="Categories">

    <template #header>
      <h2 class="h4 font-weight-bold">
        Categories
      </h2>
      <Link class="btn btn-dark"  :href="route('categories.create')">
        Create
      </Link>
    </template>

        <table class="table">
      <thead>
          <tr>
              <th>Title</th>
              <th>Edit</th>
              <th>Delete</th>
          </tr>

      </thead>
      <tbody>

          <tr v-for="category in categories" :key="category.id">
              <td>{{category.title}}</td>
              <td>
              <Link class="btn btn-primary" :href="route('categories.edit',category.id)">Edit</Link>
              </td>
              <td><button class="btn btn-danger" @click="destroy(category.id)">Delete</button></td>
          </tr>

      </tbody>
  </table>

  </admin-layout>
</template>

<script>
import { defineComponent } from "vue"
import AdminLayout from "@/Layouts/AdminLayout.vue"
import { Link } from '@inertiajs/inertia-vue3'


export default defineComponent({
  components: {
    AdminLayout,
    Link,
  },
  props: {

      categories:Array,
  },
  data(){
    return {

    }
  },
  methods:{

    destroy(categoryId) {
      if (confirm('Are you sure you want to delete this category?')) {
        this.$inertia.delete(this.route('categories.destroy',categoryId), {
                onSuccess: () => {

                    Toast.fire({
                        icon: 'success',
                        title: this.$page.props.flash.message
                    })
                },
            })
      }
    },
  }
});
</script>
