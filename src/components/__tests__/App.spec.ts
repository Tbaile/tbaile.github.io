import { describe, expect, it } from 'vitest'

import { mount } from '@vue/test-utils'
import App from '../../App.vue'

describe('App', () => {
  it('renders properly', () => {
    const wrapper = mount(App)
    expect(wrapper.text()).toContain('Hello World!')
    expect(wrapper.text()).toContain('This is a work in progress, please come back again later.')
    expect(wrapper.get('a').attributes('href')).toBe('https://github.com/Tbaile')
    expect(wrapper.get('a > p').text()).toBe('@Tbaile')
  })
})
