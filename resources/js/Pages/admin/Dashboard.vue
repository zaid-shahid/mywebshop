<template>
<admin-layout title="Dashboard">
    <template #header>
        <h2 class="h4 font-weight-bold">
            Dashboard
        </h2>
    </template>

    <table class="table text-center">
        <thead>
            <tr>
                <th>Website</th>
                <th>Logo</th>
                <th>CopyRight</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Edit</th>
            </tr>
        </thead>

        <tbody>
            <tr v-for="option in options" :key="option.id">
                <td>{{option.website}}</td>
                <td><img :src="'../uploads/options/'+ option.logo" width="50" height="50"></td>
                <td>{{option.copyright}}</td>
                <td>{{option.email}}</td>
                <td>{{option.phone}}</td>
                <td>
                    <Link class="btn btn-primary" :href="route('option.edit',option.id)">
                    Edit
                    </Link>
                </td>
            </tr>
        </tbody>
    </table>

</admin-layout>
</template>

<script>
import AdminLayout from "@/Layouts/AdminLayout.vue"
import {
    Link,

} from '@inertiajs/inertia-vue3'

export default {
    components: {

        AdminLayout,
        Link,

    },
    props: {

        options: Object,
    },
    method: {

    }
}
</script>
