<template>
<admin-layout title="Categories">

    <template #header>
        <h2 class="h4 font-weight-bold">
            Edit Member
        </h2>
    </template>
    
    <form class="col-6" @submit.prevent="update">

        <label class="form-label" for="Name">Name</label>
        <input class="form-control" id="Name" v-model="form.name" />
        <div v-if="errors.name" class="alert alert-danger">{{errors.name}}</div>

        <label class="form-label" for="email">Email</label>
        <input type="email" class="form-control" id="email" v-model="form.email" />
        <div v-if="errors.email" class="alert alert-danger">{{errors.email}}</div>

        <label class="form-label" for="password">Password</label>
        <input type="password" class="form-control" id="password" v-model="form.password" />
        <div v-if="errors.password" class="alert alert-danger">{{errors.password}}</div>

        <label for="type">Member Type</label>
        <select id="type" class="form-select" v-model="form.membership_id">
            <option v-for="membership in memberships" :key="membership.id" :value="membership.id" :selected="membership.id===form.membership_id">{{membership.type}}</option>
        </select>

        <button :disabled="form.processing" class="btn btn-primary mt-3" type="submit">Update</button>
    </form>

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

        member: Object,
        memberships: Object,
        errors: Object,
    },

    data() {
        return {

            form: this.$inertia.form({

                name: this.member.name,
                email: this.member.email,
                password: this.member.password,
                membership_id: this.member.membership.id,
            })

        }
    },

    methods: {

        update() {
            this.form.put(this.route('members.update', this.member.id), {
                onSuccess: () => {

                    Toast.fire({
                        icon: 'success',
                        title: this.$page.props.flash.message
                    })
                },
            })
        }

    },
});
</script>
