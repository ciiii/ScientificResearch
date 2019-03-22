import PDF from './pdf.vue'

var $vm
console.log($vm, "4455")
export default {
    install(Vue, options) {
        if (!$vm) {
            const PDFPlugin = Vue.extend(PDF)
            $vm = new PDFPlugin().$mount()
            document.body.appendChild($vm.$el)
        }
        Vue.prototype.$showPDF = function(url) {
            $vm.showPDF(url)
        }
    }
}