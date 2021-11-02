<template>
<admin-layout title="Products">

    <template #header>
        <h2 class="h4 font-weight-bold">
            Edit Product
        </h2>
    </template>

    <form class="col-6" @submit.prevent="update">

        <label class="form-label" for="name">Name</label>
        <input class="form-control" id="name" v-model="form.name" />
        <div class="alert alert-danger" v-if="errors.name">{{errors.name}}</div>

        <label class="form-label" for="price">Price</label>
        <input class="form-control" id="price" v-model="form.price" />
        <div class="alert alert-danger" v-if="errors.price">{{errors.price}}</div>

        <label class="form-label" for="keywords">Keywords</label>
        <input class="form-control" id="keywords" v-model="form.keywords" />
        <div class="alert alert-danger" v-if="errors.keywords">{{errors.keywords}}</div>

        <label class="form-label" for="image">Image</label>
        <label class="form-label" for="image">Image</label>
        <input id="image" type="file" @input="form.image = $event.target.files[0]" />
        <progress v-if="form.progress" :value="form.progress.percentage" max="100">
            {{ form.progress.percentage }}%
        </progress>
        <div class="alert alert-danger" v-if="errors.image">{{errors.image}}</div>

        <label class="form-label" for="category">Category</label>
        <select id="cateogry" class="form-select" v-model="form.category_id" required>
            <option v-for="category in categories" :key="category.id" :value="category.id" :selected="category.id===form.category_id">{{category.title}}</option>
        </select>

        <button :disabled="form.processing" class="btn btn-dark mt-3" type="submit">Update</button>

    </form>

</admin-layout>
</template>

<script>
import {
    defineComponent
} from "vue"
import AdminLayout from "@/Layouts/AdminLayout.vue"
import {
    Link
} from '@inertiajs/inertia-vue3'

export default defineComponent({

    components: {
        AdminLayout,
        Link,

    },
    props: {

        product: Object,
        errors: Object,
        categories: Object,

    },

    data() {
        return {

            form: this.$inertia.form({

                _method: 'put',
                name: this.product.name,
                price: this.product.price,
                keywords: this.product.keywords,
                image: null,
                category_id: this.product.category.id,
            
            })

        }
    },

    methods: {

        update() {

            this.form.post(this.route('products.update', this.product.id ),{
                onSuccess: () => {

                    Toast.fire({
                        icon: 'success',
                        title: this.$page.props.flash.message
                    })
                },
            })
            
        }

    },
});
</script>
