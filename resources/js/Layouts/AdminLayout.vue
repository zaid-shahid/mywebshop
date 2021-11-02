<template>
<div>

    <Head :title="title" />

    <AdminHeader/>

    <!-- Page Heading -->
    <header class="d-flex py-3 bg-white shadow-sm border-bottom">
        <div class="container d-flex justify-content-between">
            <slot name="header"></slot>
        </div>
    </header>

    <!-- Page Content -->
    <main class="container my-5">
        <slot></slot>
    </main>
</div>
</template>

<script>
import JetDropdown from '@/Jetstream/Dropdown.vue'
import {
    Head,
    Link
} from '@inertiajs/inertia-vue3'
import JetDropdownLink from '@/Jetstream/DropdownLink.vue'

import AdminHeader from "@/Components/AdminHeader.vue"

export default {
    props: {
        title: String,
    },

    components: {
        Head,
        Link,
        JetDropdown,
        JetDropdownLink,
        AdminHeader,
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
