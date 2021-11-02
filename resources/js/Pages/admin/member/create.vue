<template>
<admin-layout title="Categories">

    <template #header>
        <h2 class="h4 font-weight-bold">
            Create Member
        </h2>
    </template>

    <form class="col-6" @submit.prevent="store">

        <label class="form-label" for="Name">Name</label>
        <input class="form-control" id="Name" v-model="form.name" :error="form.errors.name" />
        <div v-if="errors.name" class="alert alert-danger">{{errors.name}}</div>

        <label class="form-label" for="email">Email</label>
        <input type="email" class="form-control" id="email" v-model="form.email" :error="form.errors.email" />
        <div v-if="errors.email" class="alert alert-danger">{{errors.email}}</div>
        
        <label class="form-label" for="password">Password</label>
        <input type="password" class="form-control" id="password" v-model="form.password" :error="form.errors.password" />
        <div v-if="errors.password" class="alert alert-danger">{{errors.password}}</div>

        <label for="type">Membership Type</label>
        <select id="type" class="form-select" v-model="form.type" required>
            <option v-for="membership in memberships" :key="membership.id" :value="membership.id">{{membership.type}}</option>
        </select>

        <button :disabled="form.processing" class="btn btn-primary mt-3" type="submit">Create</button>
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

        memberships : Object,
        errors : Object,

    },
    data() {
        return {

            form: this.$inertia.form({

                name: null,
                email: null,
                password: null,
                type : null,
            })
        }
    },
    methods: {

        store() {
            this.form.post(this.route('members.store'), {
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
