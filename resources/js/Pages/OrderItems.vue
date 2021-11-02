<template>
<HomeHeader />


<h2 class="py-3 text-center">Orders Details</h2>

<table class="table text-center">
    <thead>
        <tr>
            <th>Order Id</th>
            <th>Product</th>
            <th>Quantity</th>
        </tr>

    </thead>
    <tbody>

        <tr>
            <th>{{orderDetail.order_id}}</th>
            <th>{{orderDetail.product.name}}</th>
            <th>{{orderDetail.itemQuantity}}</th>
        </tr>

    </tbody>
</table>
<div class=" text-center py-3">

    <Link :href="route('dashboard')" class="btn btn-primary">Go Back</Link>

</div>


</template>

<script>
import {
    defineComponent
} from "vue"
import HomeHeader from "@/Components/HomeHeader.vue"
import {
    Link
} from '@inertiajs/inertia-vue3';

export default defineComponent({
    components: {
        HomeHeader,
        Link,
    },
    props: {

        orderDetail: Object
    },
    methods: {



    }
});
</script>
