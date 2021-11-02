<template>
<div class="row">

    <div class="col-md-6 text-center">
        <img :width="400" :height="400" :src="'/uploads/products/'+product.image">
    </div>
    <div class="col-md-6 text-center">
        <h2>{{product.name}}</h2>

        <h5>Rs. {{product.price}}</h5>

        <p>Shipping : Free</p>

        <p>In stock</p>
        <p>Almost sold out!</p>
        <p>Out of stock</p>

        <p>details</p>

        <div class="mb-2">Color</div>

        <input type='number' v-model="form.quantity" min='1' max='9' class='text-center me-3'>

        <button @click.prevent="addToCart(product.id)" type="button" class='btn btn-primary btn-sm'>Add to Cart</button>

    </div>
</div>
</template>

<script>

export default {
    props: {

        product: Object,

    },
    data() {

        return {

            form: this.$inertia.form({

                product_id: null,
                quantity: 1,
            }),

        }
    },
    methods: {

        addToCart(product_id) {

            this.form.product_id = product_id;
            this.form.post(route('cart.store'), {
                onSuccess: () => {

                    var icon = this.$page.props.flash.message === 'Added Successfully' ? 'success' : 'info'

                    Toast.fire({
                        icon: icon,
                        title: this.$page.props.flash.message
                    })
                },

                preserveState: false

            });

        }

    }
}
</script>
