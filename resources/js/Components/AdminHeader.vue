<template>
        <nav class="navbar navbar-expand-md navbar-dark bg-dark border-bottom sticky-top">
        <div class="container">
            <!-- Logo -->
            <Link class="navbar-brand text-primary" :href="route('dashboard.admin')">
            <h1><b>Admin Panel</b></h1>
            </Link>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <!-- Left Side Of Navbar -->
                <ul class="navbar-nav m-auto">
                    <li class="nav-item" >
                        <Link class=" " :href="route('dashboard.admin')" :class="isUrl('admin/dashboard') ? 'btn btn-primary m-2' : 'btn btn-outline-light m-2'">
                        Home
                        </Link>
                    </li>
                    <li>
                        <Link class="" :href="route('categories.index')" :class="isUrl('admin/categories') ? 'btn btn-primary m-2' : 'btn btn-outline-light m-2'">
                        Categories
                        </Link>
                    </li>
                    <li>
                        <Link class="" :href="route('products.index')" :class="isUrl('admin/products') ? 'btn btn-primary m-2' : 'btn btn-outline-light m-2'">
                        Products
                        </Link>
                    </li>
                    <li>
                        <Link class="" :href="route('members.index')" :class="isUrl('admin/members') ? 'btn btn-primary m-2' : 'btn btn-outline-light m-2'">
                        Members
                        </Link>
                    </li>
                    <li>
                        <Link class="" :href="route('memberships.index')" :class="isUrl('admin/memberships') ? 'btn btn-primary m-2' : 'btn btn-outline-light m-2'">
                        Memberships
                        </Link>
                    </li>
                    <li>
                        <Link class="" :href="route('orders.index')" :class="isUrl('admin/orders') ? 'btn btn-primary m-2' : 'btn btn-outline-light m-2'">
                        Orders
                        </Link>
                    </li>
                </ul>

                <!-- Right Side Of Navbar -->
                <ul class="navbar-nav align-items-baseline">

                    <!-- Authentication Links -->
                    <jet-dropdown id="settingsDropdown">
                        <template #trigger>
                            <img v-if="$page.props.jetstream.managesProfilePhotos" class="rounded-circle" width="32" height="32" :src="$page.props.user.profile_photo_url" :alt="$page.props.user.name" />

                            <span v-else>
                                {{ $page.props.user.name }}

                                <svg class="ms-2" width="18" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                                    <path fill-rule="evenodd" d="M10 3a1 1 0 01.707.293l3 3a1 1 0 01-1.414 1.414L10 5.414 7.707 7.707a1 1 0 01-1.414-1.414l3-3A1 1 0 0110 3zm-3.707 9.293a1 1 0 011.414 0L10 14.586l2.293-2.293a1 1 0 011.414 1.414l-3 3a1 1 0 01-1.414 0l-3-3a1 1 0 010-1.414z" clip-rule="evenodd" />
                                </svg>
                            </span>
                        </template>

                        <template #content>
                            <!-- Account Management -->
                            <h6 class="dropdown-header small text-muted">
                                Manage Account
                            </h6>

                            <jet-dropdown-link :href="route('profile.show')">
                                Profile
                            </jet-dropdown-link>

                            <jet-dropdown-link :href="route('api-tokens.index')" v-if="$page.props.jetstream.hasApiFeatures">
                                API Tokens
                            </jet-dropdown-link>

                            <hr class="dropdown-divider">

                            <!-- Authentication -->
                            <form @submit.prevent="logout">
                                <jet-dropdown-link as="button">
                                    Log out
                                </jet-dropdown-link>
                            </form>
                        </template>
                    </jet-dropdown>
                </ul>
            </div>
        </div>
    </nav>
</template>

<script>
import JetDropdown from '@/Jetstream/Dropdown.vue'
import {
    Head,
    Link
} from '@inertiajs/inertia-vue3'
import JetDropdownLink from '@/Jetstream/DropdownLink.vue'

export default {
    props: {
        title: String,
    },

    components: {
        Head,
        Link,
        JetDropdown,
        JetDropdownLink,
    },

    data() {
        return {
            showingNavigationDropdown: false,
        }
    },

    methods: {
        switchToTeam(team) {
            this.$inertia.put(route('current-team.update'), {
                'team_id': team.id
            }, {
                preserveState: false
            })
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
