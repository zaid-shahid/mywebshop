<template>
<div class='card mb-5  border border-primary'>

    <img :src="'uploads/products/'+product.image" class='card-img-top'>

    <div class='card-body'>

        <h6 class='card-title text-capitalize text-center'><b>{{product.name}}</b></h6>

        <div class='mt-md-3'>


            <b>Rs. {{product.price}}</b>

            <button @click="showProduct(product.id)" type="button" class='float-end btn btn-primary btn-sm'>Show Details</button>
           
        </div>

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
            this.form.post(route('cart.store'),{},{ preserveState: true });

        },
        showProduct(product_id) {

            this.$inertia.get(route('product.show',product_id));

        }

    }
}
</script>
