import Foundation

public protocol Paging: AnyObject {
    
    var page: Int { get set }
    
    /// Marked as if there is no more data
    var noMoreData: Bool { get set }
    
    func setPage(_ page: Int, noMoreData: Bool)
    
    /// Reset to first page
    func reset()
}

extension Paging {
    
    public func setPage(_ page: Int, noMoreData: Bool) {
        self.page = page
        self.noMoreData = noMoreData
    }
    
}

public protocol Pagingable {
    var paging: Paging { get set }
}

public class Page: Paging {
    
    private var initPage: Int
    public var page: Int
    public var noMoreData: Bool
    
    public init(
        _ page: Int,
        noMoreData: Bool = false
    ) {
        self.initPage = page
        self.page = page
        self.noMoreData = noMoreData
    }
    
    public func reset() {
        self.page = initPage
        self.noMoreData = false
    }
}
