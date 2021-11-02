<template>
<admin-layout title="Payment">

    <template #header>
        <h2 class="h4 font-weight-bold">
            Payment Detail
        </h2>
    </template>
    <form>

        <div class="row">

            <div class="col-md-6 my-3 ">

                <label for="payment_method" class="form-label">Payment Method</label>
                <input id="payment_method" v-model="form.payment_method" type="text" class="form-control" readonly>

            </div>

            <div class="col-md-6 my-3">

                <label for="cc-name" class="form-label">Name on card</label>
                <input v-model="form.name_on_card" type="text" class="form-control" id="cc-name" readonly>

            </div>

            <div class="col-md-6 my-3 ">

                <label for="cc-number" class="form-label">Card number</label>
                <input v-model="form.card_no" type="number" class="form-control" id="cc-number" readonly>

            </div>

            <div class="col-md-6 my-3 ">

                <label for="cc-expiration" class="form-label">Expiration</label>
                <input v-model="form.card_expiration" type="month" class="form-control" id="cc-expiration" readonly>

            </div>

            <div class="col-md-6 my-3 ">

                <label for="cc-cvv" class="form-label">CVV</label>
                <input v-model="form.c_v_v" type="number" class="form-control" id="cc-cvv" readonly>

            </div>

            <div class="col-md-6 mt-5 text-center">

                <Link :href="route('orders.index')" class="btn btn-primary">Go Back</Link>

            </div>

        </div>

    </form>
</admin-layout>
</template>

<script>

import AdminLayout from "@/Layouts/AdminLayout.vue"
import { Link } from '@inertiajs/inertia-vue3';


export default {
    components: {
        AdminLayout,
        Link
    },
    data() {

        return {

            form: {

                payment_method: this.payment.payment_method,
                name_on_card: this.payment.name_on_card,
                card_no: this.payment.card_no,
                card_expiration: this.payment.card_expiration,
                c_v_v: this.payment.c_v_v,

            }

        }
    },

    props: {

        payment: Object,

    },

    methods: {

    }
}
</script>
