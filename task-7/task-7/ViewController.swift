//
//  ViewController.swift
//  task-7
//
//  Created by Ахмеров Дмитрий Николаевич on 21.07.2023.
//

import UIKit

final class ViewController: UIViewController, UIScrollViewDelegate {

	private let imageHeight: CGFloat = 270

	private lazy var scrollView: UIScrollView = {
		let scrollView = UIScrollView(frame: view.frame)
		scrollView.contentSize.height = view.frame.height * 2
		scrollView.delegate = self

		return scrollView
	}()

	private lazy var imageView: UIImageView = {
		let imageView = UIImageView(frame: .init(origin: .zero, size: .init(width: view.frame.width, height: imageHeight)))
		imageView.image = UIImage(named: "background")
		imageView.contentMode = .scaleAspectFill

		return imageView
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemBackground
		view.addSubview(scrollView)
		scrollView.addSubview(imageView)
	}

	// MARK: - UIScrollViewDelegate

	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		let offset = scrollView.contentOffset.y
		if offset <= .zero {
			imageView.frame.origin.y = offset
			imageView.frame.size.height = imageHeight - offset
		}
		scrollView.verticalScrollIndicatorInsets.top = imageHeight - offset - view.safeAreaInsets.top
	}
}
