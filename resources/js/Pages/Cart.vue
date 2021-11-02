<template>
<HomeHeader />

<main class="container my-5">

    <div class="row">

        <div class="col-12 text-center">

            <table class="table mt-3 text-center">

                <thead>

                    <tr class="align-text-top">

                        <th>Remove</th>
                        <th>Name</th>
                        <th>Quantity</th>
                        <th>Unit Price<br><span class="text-muted">Single item Price</span></th>
                        <th>Sub Total<br><span class="text-muted">Quantity x Unit Price</span></th>

                    </tr>

                </thead>

                <tbody>

                    <tr v-for="(cart,index) in myCarts" :key="cart.id" class="">

                        <td><button @click="destroyCart(cart.id)" class='btn btn-danger btn-sm'>X</button></td>

                        <td class='text-capitalize'>{{myCarts[index].product.name}}</td>

                        <td><input type='number' min='1' max='9' v-model="myCarts[index].quantity" class='text-center'></td>

                        <td class="text-center">
                            <input class="text-center" readonly type='number' v-model="myCarts[index].product.price">

                        </td>

                        <td><input class="text-center" readonly type='number' :value="myCarts[index].quantity * myCarts[index].product.price"></td>

                    </tr>

                </tbody>

            </table>

            <div class="mt-5">

                <h5 v-if="this.carts.length == 0">There is No Product in Your Cart</h5>

                <h5 v-if="this.carts.length !== 0  && this.user==null">

                    <b> Total : Rs. {{getTotal}} </b>

                    <br>

                    <span class="text-muted">Please
                        <Link :href="route('login')">Login</Link> to Your Account to get Discount</span>

                </h5>

                <h5 v-if="this.user && this.carts.length !== 0">

                    Total : Rs. {{getTotal}}

                    <br>

                    <b>After Discount: Rs. {{discounted_amount}}</b>

                    <br>

                    <span class="text-muted">discounted ({{this.user[0].user_type.discount}}%)</span>
                </h5>

            </div>

            <div class="d-flex justify-content-around">

                <button @click="updateCart()" class="btn btn-primary">Update Cart</button>

                <button @click="checkOut()" class="btn btn-primary">Checkout</button>
            </div>
        </div>

    </div>

</main>
</template>

<script>
import HomeHeader from "@/Components/HomeHeader.vue"
import {
    computed
} from "vue"
import {
    Head,
    Link,
    usePage
} from '@inertiajs/inertia-vue3';

export default {

    setup() {
        const user = computed(() => usePage().props.value.auth.user)
        return {
            user
        }
    },
    components: {

        HomeHeader,
        Link,
        Head,
        usePage,

    },
    props: {

        carts: Object,

    },
    data() {

        return {

            myCarts: this.carts,
        }
    },
    computed: {

        getTotal() {

            var total = 0

            this.carts.forEach(function (cart) {

                total += (cart.quantity * cart.product.price)

            });

            return total

        },

        discounted_amount() {

            var total = this.getTotal;

            if (this.user) {

                var discount_percent = this.user[0].user_type.discount;

                var discount = (discount_percent / 100) * total;

                var discounted_amount = total - discount;

                return discounted_amount;

            }

            return total;
        },

    },
    methods: {

        updateCart() {

            this.$inertia.post(this.route('cart.update'), {
                'carts': this.myCarts
            })
        },

        destroyCart(id) {

            if (confirm('Are you sure you want to remove this/these items from cart')) {

                this.$inertia.delete(this.route('cart.destroy', id), {
                    preserveState: false
                })
            }
        },
        checkOut() {

            if (this.carts.length == 0) {

                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'There is no Product in your Cart!',
                });

                return false;
            }

            localStorage.setItem('amount', this.discounted_amount)

            this.$inertia.get(this.route('checkout.index'))

        },
    },

}
</script>
