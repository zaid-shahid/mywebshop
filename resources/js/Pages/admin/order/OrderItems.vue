<template>
<admin-layout title="Orders">

    <template #header>
        <h2 class="h4 font-weight-bold">
            Order Detail
        </h2>

        <Link :href="route('orders.index')" class="btn btn-primary">Go Back</Link>
    </template>

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

</admin-layout>
</template>

<script>
import {
    defineComponent
} from "vue"
import AdminLayout from "@/Layouts/AdminLayout.vue"
import { Link } from '@inertiajs/inertia-vue3';


export default defineComponent({
    components: {
        AdminLayout,
        Link,
    },
    props: {

        orderDetail: Object
    },
    methods: {


    }
});
</script>
