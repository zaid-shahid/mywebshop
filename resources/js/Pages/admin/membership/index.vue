<template>
<admin-layout title="Memberships">

    <template #header>
        <h2 class="h4 font-weight-bold">
            Memberships
        </h2>
        <Link class="btn btn-dark" :href="route('memberships.create')">
        Create
        </Link>
    </template>

    <table class="table">
        <thead>
            <tr>
                <th>Type</th>
                <th>Discount</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>

        </thead>
        <tbody>

            <tr v-for="membership in memberships" :key="membership.id">
                <td>{{membership.type}}</td>
                <td>{{membership.discount}}</td>
                <td>
                    <Link class="btn btn-primary" :href="route('memberships.edit',membership.id)">Edit</Link>
                </td>
                <td><button class="btn btn-danger" @click="destroy(membership.id)">delete</button></td>
            </tr>

        </tbody>
    </table>

</admin-layout>
</template>

<script>
import {
    defineComponent
} from "vue"
import AdminLayout from "@/Layouts/AdminLayout.vue"
import {
    Link
} from '@inertiajs/inertia-vue3'

export default defineComponent({
    components: {
        AdminLayout,
        Link
    },
    props: {

        memberships: Array
    },
    methods: {

        destroy(membershipId) {
            if (confirm('Are you sure you want to delete this membership?')) {
                this.$inertia.delete(this.route('memberships.destroy', membershipId), {
                onSuccess: () => {

                    Toast.fire({
                        icon: 'success',
                        title: this.$page.props.flash.message
                    })
                },
            })
            }
        },
    }
});
</script>
