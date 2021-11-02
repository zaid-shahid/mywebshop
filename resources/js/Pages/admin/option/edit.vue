<template>
<admin-layout title="Products">

    <template #header>
        <h2 class="h4 font-weight-bold">
            Edit Options
        </h2>
    </template>

    <form class="col-6" @submit.prevent="update">

        <label class="form-label" for="website">Website</label>
        <input class="form-control" id="website" v-model="form.website" />
        <div class="alert alert-danger" v-if="errors.website">{{errors.website}}</div>

        <label class="form-label" for="logo">logo</label>
        <input id="logo" type="file" @input="form.logo = $event.target.files[0]" />
        <progress v-if="form.progress" :value="form.progress.percentage" max="100">
            {{ form.progress.percentage }}%
        </progress>
        <div class="alert alert-danger" v-if="errors.logo">{{errors.logo}}</div>

        <label class="form-label" for="copyright">CopyRight</label>
        <input class="form-control" id="copyright" v-model="form.copyright" />
        <div class="alert alert-danger" v-if="errors.copyright">{{errors.copyright}}</div>

        <label class="form-label" for="email">Email</label>
        <input class="form-control" id="copyright" v-model="form.email" />
        <div class="alert alert-danger" v-if="errors.email">{{errors.email}}</div>

        <label class="form-label" for="email">Phone</label>
        <input class="form-control" id="copyright" v-model="form.phone" />
        <div class="alert alert-danger" v-if="errors.phone">{{errors.phone}}</div>

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
        Link,

    },
    props: {


        errors: Object,
        option: Object,


    },

    data() {
        return {

            form: this.$inertia.form({

                _method: 'put',
                website: this.option.website,
                logo: null,
                copyright: this.option.copyright,
                email: this.option.email,
                phone: this.option.phone,

            })

        }
    },

    methods: {

        update() {

            this.form.post(this.route('option.update', this.option.id), {
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
