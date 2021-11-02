<template>
<admin-layout title="Members">

    <template #header>
        <h2 class="h4 font-weight-bold">
            Members
        </h2>
        <Link class="btn btn-dark" :href="route('members.create')">
        Create
        </Link>
    </template>

    <table class="table">
        <thead>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Password</th>
                <th>Member Type</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>

        </thead>
        <tbody>

            <tr v-for="member in members" :key="member.id">
                <td>{{member.name}}</td>
                <td>{{member.email}}</td>
                <td>{{member.password}}</td>
                <td>{{member.user_type.type}}</td>
                <td>
                    <Link class="btn btn-primary" :href="route('members.edit',member.id)">Edit</Link>
                </td>
                <td><button class="btn btn-danger" @click="destroy(member.id)">delete</button></td>
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
        Link,

    },
    props: {

        members: Array,
    },
    methods: {

        destroy(memberId) {
            if (confirm('Are you sure you want to delete this member?')) {
                this.$inertia.delete(this.route('members.destroy', memberId), {
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
