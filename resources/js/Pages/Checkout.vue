<template>
<HomeHeader />

<div class="container">

    <div class="row">

        <div class="col-md-4">
            <OrderSummary :amount="this.amount" :carts="this.carts" />
        </div>
        <div class="col-md-8">

            <h4 class="my-3 text-center">Payment</h4>

            <PaymentForm :amount="this.amount" :carts="this.carts" />
        </div>

    </div>

</div>
</template>

<script>
import HomeHeader from "@/Components/HomeHeader.vue"
import OrderSummary from "@/Components/OrderSummary.vue"
import PaymentForm from "@/Components/PaymentForm.vue"
import { Head,Link } from '@inertiajs/inertia-vue3';


export default {
    components: {

        HomeHeader,
        OrderSummary,
        PaymentForm,
        Head,
        Link

    },

    props: {

        carts: Object,

    },

    data(){

        return {

            amount: localStorage.getItem('amount'),
            
        }
    }
}
</script>
