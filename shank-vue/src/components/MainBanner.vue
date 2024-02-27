<script setup>
import HeaderItem from './HeaderItem.vue'
import DocumentationIcon from './icons/IconDocumentation.vue'
import ToolingIcon from './icons/IconTooling.vue'
import EcosystemIcon from './icons/IconEcosystem.vue'
import CommunityIcon from './icons/IconCommunity.vue'
import SupportIcon from './icons/IconSupport.vue'
</script>

<template>
  <HeaderItem>
    <template #icon>
      <DocumentationIcon />
    </template>
    <template #heading>Summary</template>
  </HeaderItem>

  <HeaderItem>
    <template #icon>
      <ToolingIcon />
    </template>
    <template #heading>Experience</template>
  </HeaderItem>

  <HeaderItem>
    <template #icon>
      <EcosystemIcon />
    </template>
    <template #heading>Demo</template>
  </HeaderItem>

  <HeaderItem>
    <template #icon>
      <CommunityIcon />
    </template>
    <template #heading>Social</template>
  </HeaderItem>

  <HeaderItem>
    <template #icon>
      <SupportIcon />
    </template>
    <template #heading>Support Vue</template>
  </HeaderItem>
</template>
