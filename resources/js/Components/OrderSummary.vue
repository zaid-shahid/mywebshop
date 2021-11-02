<template>
<div class='row mt-2 float-md-start text-center'>

    <div class="accordion-item  border-0 ">

        <button class="btn btn-primary" data-bs-toggle="collapse" data-bs-target="#order_summary" aria-expanded="false">

            Click to See Order Summary

        </button>

        <div id="order_summary" class="accordion-collapse collapse">

            <div class="accordion-body">
                <table class="table text-capitalize ">
                    <tr>
                        <th>Product(s)</th>
                        <th>Quantity</th>
                    </tr>
                    <tbody>

                        <tr v-for="cart in carts" :key="cart.id">
                            <td>{{cart.product.name}}</td>
                            <td>{{cart.quantity}}</td>
                        </tr>

                    </tbody>
                </table>

                    <b> Total Amount: {{this.amount}}</b>
                    <br>


                <Link :href="route('cart.index')" class="btn btn-primary btn-sm">Go Back To Update Cart</Link>

            </div>

        </div>

    </div>

</div>
</template>

<script>
import {
    defineComponent
} from "vue"

import {
    Head,
    Link
} from '@inertiajs/inertia-vue3';

export default {
    components: {

        Link,

    },

    props: {

        amount: String,
        carts: Object,

    },
}
</script>
