<template>
<admin-layout title="Categories">

    <template #header>
        <h2 class="h4 font-weight-bold">
            Edit Category
        </h2>
        <Link class="btn btn-outline-dark" :href="route('categories.index')">
        Go Back
        </Link>
    </template>

    <form class="col-6" @submit.prevent="update">

        <label class="form-label" for="title">Title</label>
        <input class="form-control" id="title" v-model="form.title" />
        <h6 class="alert alert-danger" v-if="errors.title">{{errors.title}}</h6>
        <button :disabled="form.processing" class="btn btn-dark mt-3" type="submit">Update</button>
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

        category: Object,
        errors: Object
    },

    data() {
        return {

            form: this.$inertia.form({

                title: this.category.title,
            })

        }
    },

    methods: {

        update() {
            this.form.put(this.route('categories.update', this.category.id), {
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
