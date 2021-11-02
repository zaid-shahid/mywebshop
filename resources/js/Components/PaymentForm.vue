<template>

<form @submit.prevent="saveOrder()">

    <div class="row">

        <div class="col-12 my-3  text-center">

            <input id="credit" value="credit_card" v-model="form.payment_method" name="payment_method" type="radio" class="form-check-input">
            <label class="form-check-label me-5" for="credit">Credit card</label>

            <input id="debit" value="debit_card" v-model="form.payment_method" name="payment_method" type="radio" class="form-check-input">
            <label class="form-check-label me-5" for="debit">Debit card</label>

            <div class="alert alert-danger" v-if="form.errors.payment_method">{{form.errors.payment_method}}</div>

        </div>

        <div class="col-md-6 my-3 form">

            <label for="cc-name" class="form-label">Name on card</label>
            <input v-model="form.name_on_card" type="text" class="form-control" id="cc-name">
            <small class="text-muted">Full name as displayed on card</small>
            <div class="alert alert-danger" v-if="form.errors.name_on_card">{{form.errors.name_on_card}}</div>

        </div>

        <div class="col-md-6 my-3 ">

            <label for="cc-number" class="form-label">Card number</label>
            <input v-model="form.card_no" type="number" class="form-control" id="cc-number">
            <small class="text-muted">Enter without dashes/hyphens</small>
            <div class="alert alert-danger" v-if="form.errors.card_no">{{form.errors.card_no}}</div>

        </div>

        <div class="col-md-6 my-3 ">

            <label for="cc-expiration" class="form-label">Expiration</label>
            <input v-model="form.card_expiration" type="month" class="form-control" id="cc-expiration">
            <div class="alert alert-danger" v-if="form.errors.card_expiration">{{form.errors.card_expiration}}</div>

        </div>

        <div class="col-md-6 my-3 ">

            <label for="cc-cvv" class="form-label">CVV</label>
            <input v-model="form.c_v_v" type="number" class="form-control" id="cc-cvv">
            <small class="text-muted">3 digits code</small>
            <div class="alert alert-danger" v-if="form.errors.c_v_v">{{form.errors.c_v_v}}</div>

        </div>

        <hr class="my-4">

        <div class="text-center">

            <button type="submit" class="btn btn-primary btn-lg" name='order'>

                Place Order

            </button>

        </div>

    </div>

</form>
</template>

<script>
export default {
    components: {

    },
    data() {

        return {

            form: this.$inertia.form({

                carts: this.carts,
                amount: this.amount,
                payment_method: null,
                name_on_card: null,
                card_no: null,
                card_expiration: null,
                c_v_v: null,

            })

        }
    },

    props: {

        amount: String,
        carts: Object,

    },

    methods: {

        saveOrder() {

            this.form.post(this.route('orders.store'), {
                onSuccess: () => {

                    localStorage.clear()

                    Swal.fire({
                        icon: 'success',
                        title: this.$page.props.flash.message
                    })
                },
            })
        }
    }
}
</script>
