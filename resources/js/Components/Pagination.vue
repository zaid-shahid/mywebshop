<template>
<div v-if="links.length > 3">
    <div class="d-flex justify-content-center">
        <template v-for="(link, p) in links" :key="p">
            <span v-if="link.url === null" class="px-4 py-3 me-1 border border-primary" v-html="link.label" />
            <Link v-else class="px-4 py-3 border border-primary me-1" :class="{ 'bg-primary text-white ': link.active }" :href="link.url" v-html="link.label" />
        </template>
    </div>
</div>
</template>

<script>
import {
    Link
} from '@inertiajs/inertia-vue3';
export default {

    components: {

        Link,

    },
    props: {
        links: Array
    },
}
</script>
