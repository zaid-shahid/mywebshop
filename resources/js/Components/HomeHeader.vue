<template>
<header class="bg-dark text-white sticky-top">

    <div class="container">

        <div class="navbar">

            <Link class="nav-link" :href="route('home')">
            <h1><b>YouMart</b></h1>
            </Link>

            <ul class="nav">

                <li>
                    <Link class="nav-link" :href="route('home')" :class="isUrl('/') ? 'text-primary' : ''">
                    Home
                    </Link>
                </li>

                <li class="nav-item dropdown">

                    <Link class="nav-link dropdown-toggle text-white" :href="route('dashboard')" id="dropdown03" data-bs-toggle="dropdown" aria-expanded="false">Categories</Link>

                    <ul class="dropdown-menu scrollable-menu" aria-labelledby="dropdown03">

                        <li v-for="category in $page.props.categories" :key="category.id">
                            <Link class='dropdown-item text-capitalize text-small' @click.prevent="showCatPro(category.id)">{{category.title}}</Link>
                            <hr class='dropdown-divider'>
                        </li>

                    </ul>

                </li>

            </ul>

            <div class=" d-flex col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">

                <input v-model="query" @keyup="search" class=" form-control me-2" placeholder="Search...">
            </div>

            <Link :href="route('cart.index')" :class="isUrl('cart') ? 'btn btn-primary' : 'btn btn-outline-light'" class='me-3'>Cart <span class='text-warning'>( {{$page.props.carts.length}} )</span></Link>

            <div v-if="user" class="text-capitalize">
                <span v-if="user[0].user_type.type=='bronze'" :style='bronze'>{{user[0].user_type.type}} member  </span>
                <span v-if="user[0].user_type.type=='silver'" :style='silver'>{{user[0].user_type.type}} member  </span>
                <span v-if="user[0].user_type.type=='gold'" :style="{color : 'gold'}">{{user[0].user_type.type}} member  </span>
            </div>

            <!-- _________________ Right Side _________________________________ -->

            <div v-if="$page.props.canLogin" class="">

                <div v-if="$page.props.user && $page.props.user.user_type_id!=1">

                    <div class='dropdown text-center'>

                        <Link class='d-block link-light text-decoration-none dropdown-toggle ' id='dropdownUser1' data-bs-toggle='dropdown' aria-expanded='false'><img v-if="$page.props.jetstream.managesProfilePhotos" class="rounded-circle" width="32" height="32" :src="$page.props.user.profile_photo_url" :alt="$page.props.user.name" />

                        <span v-else>
                            {{ $page.props.user.name }}

                            <svg class="ms-2" width="18" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                                <path fill-rule="evenodd" d="M10 3a1 1 0 01.707.293l3 3a1 1 0 01-1.414 1.414L10 5.414 7.707 7.707a1 1 0 01-1.414-1.414l3-3A1 1 0 0110 3zm-3.707 9.293a1 1 0 011.414 0L10 14.586l2.293-2.293a1 1 0 011.414 1.414l-3 3a1 1 0 01-1.414 0l-3-3a1 1 0 010-1.414z" clip-rule="evenodd" />
                            </svg>
                        </span>

                        </Link>

                        <ul class='dropdown-menu text-small' aria-labelledby='dropdownUser1'>

                            <li>
                                <Link class='dropdown-item' :href="route('profile.show')">My Profile</Link>
                            </li>

                            <li>
                                <hr class='dropdown-divider'>
                            </li>

                            <li>
                                <Link class='dropdown-item' :href="route('dashboard')">My Orders</Link>
                            </li>

                            <li>
                                <hr class='dropdown-divider'>
                            </li>

                            <form @submit.prevent="logout">

                                <li>
                                    <button type="submit" class='dropdown-item'>Logout</button>
                                </li>

                            </form>

                        </ul>

                    </div>

                </div>

                <div v-else-if="$page.props.user && $page.props.user.user_type_id==1">
                    <Link :href="route('dashboard.admin')" class="btn btn-outline-light me-1">
                    Dashboard
                    </Link>
                </div>

                <div v-else>
                    <Link :href="route('login')" class="btn btn-outline-light me-1">
                    Log in
                    </Link>

                    <Link v-if="$page.props.canRegister" :href="route('register')" class="btn btn-outline-light">
                    Register
                    </Link>
                </div>
            </div>

        </div>

    </div>

</header>
</template>

<script>
import {
    Head,
    Link,
    usePage
} from '@inertiajs/inertia-vue3';
import {
    computed
} from "vue"

export default {

    setup() {
        const user = computed(() => usePage().props.value.auth.user)
        return {
            user
        }
    },
    props: {

    },

    components: {
        Link,
        Head,
        usePage,
    },

    data() {
        return {

            query: '',
            silver: 'color : rgb(192, 192, 192);',
            bronze: 'color : #CD7F32;',

        }
    },

    methods: {

        setup() {
            const user = computed(() => usePage().props.value.auth.user)
            return {
                user
            }
        },

        search() {

            this.$inertia.get(this.route('home', {
                'search': this.query
            }), {}, {
                preserveState: true
            });

        },

        showCatPro(category_id) {

            this.$inertia.get(this.route('home', {
                'category_id': category_id
            }));

        },

        logout() {
            this.$inertia.post(route('logout'));
        },

        isUrl(...urls) {

            let currentUrl = this.$page.url.substr(1)
            if (urls[0] === '') {
                return currentUrl === ''
            }
            return urls.filter(url => currentUrl.startsWith(url)).length
        },

    },

    computed: {
        path() {
            return window.location.pathname
        }
    }
}
</script>

<style>
.scrollable-menu {

    height: auto;
    max-height: 550px;
    overflow-x: hidden;
}
</style>
