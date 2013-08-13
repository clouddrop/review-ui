package review


import javax.servlet.ServletOutputStream;

import org.samar.hbase.GetFromHbase;
import org.springframework.dao.DataIntegrityViolationException

class ReviewController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [reviewInstanceList: Review.list(params), reviewInstanceTotal: Review.count()]
    }

    def create() {
        [reviewInstance: new Review(params)]
    }

    def save() {
        def reviewInstance = new Review(params)
        if (!reviewInstance.save(flush: true)) {
            render(view: "create", model: [reviewInstance: reviewInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'review.label', default: 'Review'), reviewInstance.id])
        redirect(action: "show", id: reviewInstance.id)
    }

    def show(Long id) {
        def reviewInstance = Review.get(id)
        if (!reviewInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'review.label', default: 'Review'), id])
            redirect(action: "list")
            return
        }

        [reviewInstance: reviewInstance]
    }

    def edit(Long id) {
        def reviewInstance = Review.get(id)
        if (!reviewInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'review.label', default: 'Review'), id])
            redirect(action: "list")
            return
        }

        [reviewInstance: reviewInstance]
    }
	
	//added by samar
	def cache(Long id){
		GetFromHbase test = new GetFromHbase();
		def reviewInstance = Review.get(id)
		
		
		
		
		ServletOutputStream out = response.getOutputStream()
		out.write(test.getColEntry(reviewInstance.hash))
		out.flush()
		out.close()
		return false
		
	}

    def update(Long id, Long version) {
        def reviewInstance = Review.get(id)
        if (!reviewInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'review.label', default: 'Review'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (reviewInstance.version > version) {
                reviewInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'review.label', default: 'Review')] as Object[],
                          "Another user has updated this Review while you were editing")
                render(view: "edit", model: [reviewInstance: reviewInstance])
                return
            }
        }

        reviewInstance.properties = params

        if (!reviewInstance.save(flush: true)) {
            render(view: "edit", model: [reviewInstance: reviewInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'review.label', default: 'Review'), reviewInstance.id])
        redirect(action: "show", id: reviewInstance.id)
    }

    def delete(Long id) {
        def reviewInstance = Review.get(id)
        if (!reviewInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'review.label', default: 'Review'), id])
            redirect(action: "list")
            return
        }

        try {
            reviewInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'review.label', default: 'Review'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'review.label', default: 'Review'), id])
            redirect(action: "show", id: id)
        }
    }
}
