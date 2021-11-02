<template>
<HomeHeader />

<div class="container">
    <div class="row">
        <div class="col-12">

            <h2 class="py-3 text-center">Orders</h2>

            <table class="table text-center">
                <thead>
                    <tr>
                        <th>Order Id</th>
                        <th>Total Products</th>
                        <th>Total Amount</th>
                        <th>Order Date</th>
                        <th>Ship Date</th>
                        <th>Order Status</th>
                        <th>Items</th>
                    </tr>

                </thead>
                <tbody>

                    <tr v-for="order in orders" :key="order.id">
                        <td>{{order.id}}</td>
                        <td>{{order.totalProducts}}</td>
                        <td>{{order.totalAmount}}</td>
                        <td>{{order.orderDate}}</td>
                        <td>{{order.shipDate}}</td>
                        <td>{{order.orderStatus}}</td>
                        <td>
                            <button @click="showItems(order.id)" class="btn btn-primary">See Items</button>
                        </td>
                    </tr>

                </tbody>
            </table>
        </div>
    </div>
</div>
</template>

<script>
import HomeHeader from "@/Components/HomeHeader.vue"
import {
    Head,
    Link
} from '@inertiajs/inertia-vue3';

export default {

    components: {
        HomeHeader,
        Head,
        Link

    },
    props: {

        orders: Object,

    },
    methods: {

        showItems(order_id) {

            this.$inertia.get(this.route('orderDetail.show', order_id))

        },
    }
}
</script>
