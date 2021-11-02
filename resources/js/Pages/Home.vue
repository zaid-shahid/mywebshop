<template>
<div>

    <Head title="Home" />

    <HomeHeader  />

    <main class="container-fluid my-5">

        <ProductDetails v-if="pro" :product="pro" />

        <div v-else class="row d-flex justify-content-center">

            <ProductCard class='col-12 col-lg-3 col-sm-6 me-5' v-for="product in products.data" :key="product.id" :product="product" />

            <Pagination class="mt-6" :links="products.links" />

        </div>

    </main>
</div>
</template>

<script>
import HomeHeader from "@/Components/HomeHeader.vue"
import Pagination from '@/Components/Pagination.vue'
import ProductCard from '@/Components/ProductCard.vue'
import ProductDetails from '@/Components/ProductDetails.vue'

import { Head,Link } from '@inertiajs/inertia-vue3';

export default {
    components: {
        Head,
        Link,
        Pagination,
        HomeHeader,
        ProductCard,
        ProductDetails,
    },

    props: {

        products: Object,
        pro: Object,

    },

}
</script>
