<template>
<admin-layout title="Membership">

    <template #header>
        <h2 class="h4 font-weight-bold">
            Create Membership
        </h2>
        <Link class="btn btn-outline-dark" :href="route('memberships.index')">
        Go Back
        </Link>
    </template>

    <form class="col-6" @submit.prevent="store">

        <label class="form-label" for="type">Type</label>
        <input class="form-control" id="type" v-model="form.type" />
        <div class="alert alert-danger" v-if="errors.type">{{errors.type}}</div>

        <label class="form-label" for="discount">Discount</label>
        <input class="form-control" id="discount" v-model="form.discount" />
        <div class="alert alert-danger" v-if="errors.discount">{{errors.discount}}</div>

        <button :disabled="form.processing" class="btn btn-dark mt-3" type="submit">Create</button>
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
        Link

    },
    props: {

        errors: Object,

    },
    data() {
        return {

            form: this.$inertia.form({

                type: null,
                discount: null,
            })
        }
    },
    methods: {

        store() {
            this.form.post(this.route('memberships.store'), {
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
