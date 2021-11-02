<template>
<admin-layout title="Categories">

    <template #header>
        <h2 class="h4 font-weight-bold">
            Create Category
        </h2>
        <Link class="btn btn-outline-dark" :href="route('categories.index')">
        Go Back
        </Link>
    </template>

    <form class="col-6" @submit.prevent="store">

        <label class="form-label" for="title">Title</label>
        <input class="form-control" id="title" v-model="form.title" />
        <h6 class="alert alert-danger mt-1" v-show="errors.title">{{errors.title}}</h6>

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

                title: null,

            })
        }
    },
    methods: {

        store() {
            this.form.post(this.route('categories.store'), {
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
