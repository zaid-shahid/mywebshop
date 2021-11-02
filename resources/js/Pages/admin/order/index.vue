<template>
<admin-layout title="Orders">

    <template #header>
        <h2 class="h4 font-weight-bold">
            Orders
        </h2>
    </template>

    <table class="table text-center">
        <thead>
            <tr>
                <th>Order Id</th>
                <th>Total Products</th>
                <th>Total Amount</th>
                <th>Order Date</th>
                <th>Ship Date</th>
                <th>Order Status</th>
                <th>Customer</th>
                <th>Delete</th>
                <th>items</th>
                <th>Payment</th>
                <th>Ship</th>
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
                <td>{{order.user.email}}</td>
                <td>
                    <button class="btn btn-danger" @click="destroy(order.id)">Delete</button>
                </td>
                <td>
                    <button @click="showItems(order.id)" class="btn btn-primary">See Items</button>
                </td>
                <td>
                    <button @click="showPayments(order.payment_id)" class="btn btn-primary">See Payment</button>
                </td>
                <td>
                    <button v-once @click="shipOrder(order.id)" class="btn btn-success">Ship</button>
                </td>
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

export default defineComponent({
    components: {
        AdminLayout,
    },
    props: {

        orders: Object
    },
    methods: {

        destroy(orderId) {
            if (confirm('Are you sure you want to delete this order?')) {
                this.$inertia.delete(this.route('orders.destroy', orderId), {
                    onSuccess: () => {

                        Toast.fire({
                            icon: 'success',
                            title: this.$page.props.flash.message
                        })
                    },
                })
            }
        },

        shipOrder(order_id){


            this.$inertia.put(this.route('orders.update',order_id),{}, {
                onSuccess: () => {

                    Toast.fire({
                        icon: 'success',
                        title: this.$page.props.flash.message
                    })
                },
            })
        },

        showPayments(payment_id){

            this.$inertia.get(this.route('payment.show',payment_id))
        },
        showItems(order_id){

            this.$inertia.get(this.route('orderDetail.show',order_id))

        },
    }
});
</script>
