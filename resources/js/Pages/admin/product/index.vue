<template>
<admin-layout title="Products">

    <template #header>
        <h2>
            Products
        </h2>
        <Link class="btn btn-dark" :href="route('products.create')">
        Create
        </Link>
    </template>

    <table class="table">
        <thead>
            <tr>
                <th>Name</th>
                <th>Price</th>
                <th>Image</th>
                <th>Keywords</th>
                <th>Category</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>

        </thead>
        <tbody>

            <tr v-for="product in products" :key="product.id">
                <td>{{product.name}}</td>
                <td>{{product.price}}</td>
                <td><img :src="'../uploads/products/'+ product.image" width="50" height="50"></td>
                <td>{{product.keywords}}</td>
                <td>{{product.category.title}}</td>
                <td>
                    <Link class="btn btn-primary" :href="route('products.edit',product.id)">
                    Edit
                    </Link>
                </td>
                <td><button class="btn btn-danger" @click="destroy(product.id)">Delete</button></td>
            </tr>

        </tbody>
    </table>

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
        Link
    },
    props: {

        products: Array,
    },
    data() {

        return {

            show: true

        }

    },
    methods: {

        destroy(productId) {
            if (confirm('Are you sure you want to delete this product?')) {

                this.$inertia.delete(this.route('products.destroy', productId), {
                onSuccess: () => {

                    Toast.fire({
                        icon: 'success',
                        title: this.$page.props.flash.message
                    })
                },
            })

            }
        },
    },
    watch: {
        '$page.props.flash': {
            handler() {
                this.show = true
            },
            deep: true,
        },
    },

});
</script>
